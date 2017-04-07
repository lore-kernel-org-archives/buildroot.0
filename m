From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Apr 2017 23:32:35 +0200
Subject: [Buildroot] issue with Linux ARM start_kernel
In-Reply-To: <CABWt4esMULpB32qecospE+Uk4whCpYRSnjJddcDHJ8um8Bd5Kw@mail.gmail.com>
 (Robert Smigielski's message of "Fri, 7 Apr 2017 16:02:36 -0400")
References: <CABWt4evkoeQ6deMoLCWSuaZaxKzuR4=_BLEp8g4MKh1KELzjrQ@mail.gmail.com>
 <87inmgrpal.fsf@dell.be.48ers.dk>
 <CABWt4esN__Xx53vrRbJZVcQ7Nvc1hAC5ta3LjeAkfz_jBDDY5A@mail.gmail.com>
 <CABWt4esMULpB32qecospE+Uk4whCpYRSnjJddcDHJ8um8Bd5Kw@mail.gmail.com>
Message-ID: <871st3sy30.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Smigielski <ptdropper@gmail.com> writes:

 > Thank you sir! I did some experiments and found that altering the load
 > address to 0x1800000 corrects the problem and the board boots to a user
 > prompt!

Ok, great!

 > A million thanks!

You're welcome!

-- 
Bye, Peter Korsgaard
