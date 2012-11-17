From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 09:10:51 +0100
Subject: [Buildroot] gcc on target system issue
In-Reply-To: <CABtOAfyM4gF-AUi0cNSusC542dxcRps=TM20pJe3RdXWU69AuA@mail.gmail.com>
 (Alexander Khryukin's message of "Sat, 17 Nov 2012 00:59:20 +0300")
References: <CABtOAfxKdUhvGHF2K_BG__vPPcqmio24DW0suz86Hfzngzc01g@mail.gmail.com>
 <20121116183044.6dcfc297@skate>
 <CABtOAfyM4gF-AUi0cNSusC542dxcRps=TM20pJe3RdXWU69AuA@mail.gmail.com>
Message-ID: <87vcd4wsxg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Khryukin <alexander@mezon.ru> writes:

Hi,

 Alexander> i'm embedded linux developer and trying to build
 Alexander> OpenMandriva linux for cortex-a9, but without gcc on target
 Alexander> my work is totally unuseful.

Ok, but is buildroot the right tool for that job? It would imho make
more sense to install a full blown distribution supporting ARM
(Debian/Fedora/Ubuntu/..) and use that to rebuild the mandriva packages.

-- 
Bye, Peter Korsgaard
