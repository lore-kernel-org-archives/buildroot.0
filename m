From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Nov 2012 10:15:12 +0100
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <CABtOAfzb9n8HQ9Xbk1+1KnmTh7hHyxiQvD_7vPw5afs3YDyZMg@mail.gmail.com>
 (Alexander Khryukin's message of "Fri, 9 Nov 2012 11:58:19 +0300")
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
 <878vab8cr8.fsf@dell.be.48ers.dk>
 <CABtOAfzb9n8HQ9Xbk1+1KnmTh7hHyxiQvD_7vPw5afs3YDyZMg@mail.gmail.com>
Message-ID: <87pq3n6stb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Khryukin <alexander@mezon.ru> writes:

Hi,

 Alexander> How about to include perl-cross into buildroot packages?

I'm doing a test build right now, and will commit if that works. Perhaps
it isn't perfect yet, but certainly better than all the qemu issues
we're seing right now.

-- 
Bye, Peter Korsgaard
