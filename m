From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 09 Dec 2013 11:40:16 +0100
Subject: [Buildroot] wpa_supplicant doesn't compile
In-Reply-To: <CALADVSOXZK_dqB_UGSWKVM8D=E4S8+KkG2Pu6h5EH3d93OOyug@mail.gmail.com>
 (Javier Alejandro Saenz Leguizamon's message of "Mon, 9 Dec 2013
 05:34:17 -0500")
References: <CALADVSNmgocixipUwij+HS-bari8Toi-q_micsA44YwwRr9mUQ@mail.gmail.com>
 <87ppp68mie.fsf@dell.be.48ers.dk>
 <CALADVSOXZK_dqB_UGSWKVM8D=E4S8+KkG2Pu6h5EH3d93OOyug@mail.gmail.com>
Message-ID: <87zjoa71f3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Javier" == Javier Alejandro Saenz Leguizamon <jasaenzl@unal.edu.co> writes:

 > Hi, and thx for the quick answer, its probably the toolchain, im
 > using codesourcery 2008q3, I'm going to try again with codesoucery
 > 2013.11 i also have another problem with openvpn and LZO compression
 > but I'm going to fix this

Yes, a toolchain from 2008 can hardly contain uptodate Linux kernel
headers (2.6.29 is from 2009).

In general, you are likely to end up with problems if you try to combine
components of significant different age.

-- 
Bye, Peter Korsgaard
