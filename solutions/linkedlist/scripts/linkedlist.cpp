#include <iostream>
#include <Rcpp.h>


class Node {
public:
    Node(double val, Node *next):
        val_(val), next_(next) { }
    double val_;
    Node *next_;
};

class LinkedList {
public:
    LinkedList():
        head_(NULL), size_(0) { }

    double head() const { return head_->val_; }
    int size() const { return size_; }

    void insert(double val) {
        Node *new_node = new Node(val, head_);
        head_ = new_node;
        size_++;
    }

    void remove() {
        Node* temp = head_;
        head_ = head_->next_;
        delete temp;
        size_--;
    }

    void print() const {
        Node *ptr = head_;
        while(ptr != NULL) {
            Rcpp::Rcout << ptr->val_ << " ";
            ptr = ptr->next_;
        }
        Rcpp::Rcout << std::endl;
    }

private:
    Node *head_;
    int size_;
};


RCPP_MODULE(LinkedList_module) {
    Rcpp::class_<LinkedList>("LinkedList")

    .constructor()
    .method("insert", &LinkedList::insert, "Adds a double value to the list.")
    .method("remove", &LinkedList::remove, "Deletes current head of the list.")
    .method("head", &LinkedList::head, "Returns value of the head node of the list.")
    .method("print", &LinkedList::print, "Simple printing of all values in the list")
    .method("size", &LinkedList::size, "Returns total number of elements in the list.")
    ;
}
