From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Jan 2018 22:40:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Fix Raspberry Pi support
 for SDL2
In-Reply-To: <CAPeEpDqX83pU2u1ej_NdeemuFtKMD_cd+oGE-sw_5Y1JjbM+3w@mail.gmail.com>
 (Guillermo Amaral's message of "Fri, 19 Jan 2018 11:24:06 -0800")
References: <20180118174319.378bfb1b@windsurf.lan>
 <20180118175415.16715-1-g@maral.me>
 <ba624c50-2b56-6e76-7ccc-8fbfdf9fe5bb@gmail.com>
 <CAPeEpDouAm5vqoQQ3PmHcJwvssMe=3yyyrQUvc4zoaw3ehandw@mail.gmail.com>
 <CAPeEpDrdRC2eDW5Q=YEc8naVfNz6aLq7zbd4Wcx=FUmEmfdswQ@mail.gmail.com>
 <CAPeEpDqrw8369-bhX0j3+5T-ZWo_1bW6=tnYpw8SiWUj5KMBAQ@mail.gmail.com>
 <CAPeEpDoZ64=_wE=4OXQvZ_hJdZN9u7eAzOEbXP-+bH05dF1WGg@mail.gmail.com>
 <CAPeEpDqX83pU2u1ej_NdeemuFtKMD_cd+oGE-sw_5Y1JjbM+3w@mail.gmail.com>
Message-ID: <87r2qlcys8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillermo" == Guillermo Amaral <g@maral.me> writes:

 > Hi Ryan,
 > Yes, but to a blank line; It shouldn't break anything. I tend to leave
 > those in, in order to reduce diff changes in the future.

 > That said, I can avoid doing that in future submissions if that's frowned
 > upon here.

We generally do remove them, yes.

Thanks.

-- 
Bye, Peter Korsgaard
