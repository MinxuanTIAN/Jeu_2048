#ifndef CARRE_H
#define CARRE_H
#include <QLabel>

class Carre
{
public:
    Carre();
    Carre(const Carre &carre) { *this = carre; }
    Carre(const int val);

    int getVal(){ return currVal; }
    void update() { currVal *= MULTIPLIER; }
    bool getUpdated() { return upDated; }
    void setUpdated(const bool &upDated) { this->upDated = upDated; }

private:
    int currVal;
    bool upDated;

    static const int MULTIPLIER = 2;
};
#endif // CARRE_H
