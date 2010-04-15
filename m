From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Apr 2010 16:27:33 +0200
Subject: [Buildroot] openssl 0.9.8.n compilation problem
In-Reply-To: <q2je7c6a05e1004150424w61966695v31ec1ee0e1dfcb18@mail.gmail.com>
	(Belisko Marek's message of "Thu, 15 Apr 2010 13:24:25 +0200")
References: <q2je7c6a05e1004150424w61966695v31ec1ee0e1dfcb18@mail.gmail.com>
Message-ID: <87tyrcdc4q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Belisko" == Belisko Marek <marek.belisko@gmail.com> writes:

 Belisko> Hi,
 Belisko> I would like to build with buildroot transmission which
 Belisko> is dependent on libcurl and openssl. I have a problems with building of ssl.

 Belisko> I build toolchain in buildroot with uclibc.

Fixed in git (65e209ca).

-- 
Bye, Peter Korsgaard
