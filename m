From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Oct 2018 13:18:15 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <87o9c0lozx.fsf@tkos.co.il> (Baruch Siach's message of "Thu, 11
 Oct 2018 14:08:34 +0300")
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf> <87y3b5ks97.fsf@tkos.co.il>
 <87a7nksr18.fsf@dell.be.48ers.dk> <87o9c0lozx.fsf@tkos.co.il>
Message-ID: <875zy8spe0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> -typedef double hbase_f(double);
 >> +typedef double (*hbase_f)(double);

 > Wouldn't that make the definition 'hbase_f *val_in' a pointer to
 > function pointer?

Not in C at least. The syntax is:

typedef <returntype> (*name)(<arguments>)

https://stackoverflow.com/questions/1591361/understanding-typedefs-for-function-pointers-in-c

-- 
Bye, Peter Korsgaard
