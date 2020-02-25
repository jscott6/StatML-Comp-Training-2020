#include <Rcpp.h>
using namespace Rcpp;

class Rectangle {
public:
  Rectangle(double width, double height):
    width_(width), height_(height) { }
  double area() { return width_ * height_; }
private:
  double width_, height_;
};

RCPP_MODULE(Rectangle_Module) {
  class_<Rectangle>("Rectangle")
  
  .constructor<double, double>()
  .method("area", &Rectangle::area)
  ;
}
