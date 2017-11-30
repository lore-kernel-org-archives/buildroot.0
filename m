From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 30 Nov 2017 05:53:17 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-28
In-Reply-To: <20171129102201.GI2889@scaer>
References: <20171129070009.BC0F72037D@mail.free-electrons.com>
 <20171129102201.GI2889@scaer>
Message-ID: <20171130045316.GS27558@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
Yann E. MORIN wrote,

> >         or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/e09731abe257ee187e20aa0e75beee22004bd3e2 |     
> 
> src/client/options.cpp: In function 'client_options
> process_command_line(int, const char**)':
> src/client/options.cpp:139:1: internal compiler error: in
> merge_overlapping_regs, at regrename.c:304
>  }
>  ^
> 
> Waldemar? Should we disable it for or1k?

Yes and maybe report it to the or1k people, gcc support
isn't upstream.

I verified the problem exist even with uClibc-ng 1.0.27 and
NPTL enabled.

best regards
 Waldemar
