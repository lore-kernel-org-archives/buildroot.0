From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Jan 2014 22:05:18 +0100
Subject: [Buildroot] [PATCH] package/ola: fix build against
	google.protobuf
In-Reply-To: <1389294901-15490-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 9 Jan 2014 20:15:01 +0100")
References: <20140109191427.GB3713@free.fr>
 <1389294901-15490-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <877ga8amsx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > To test for the google.protobuf presence, ola's ./conifgure runs the
 > host Python. This is doomed to fail, as google.protobuf is installed
 > in target/ and not in host/

 > Since our dependencies ensures that goole.protobuf is indeed installed

s/goole/google/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
