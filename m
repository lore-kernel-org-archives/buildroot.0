From: Daniel Potapov <yeso@bk.ru>
Date: Mon, 7 Nov 2011 14:32:44 +0700
Subject: [Buildroot] buildroot stops at pango compilation
In-Reply-To: <CAC=eiqz2Yy=Q0WYjZVbP4FsBFpTBEcg4BdBUFbeH-Kdn4TLpjA@mail.gmail.com>
References: <CAC=eiqyR36E133EnLBVZNFWsHzx7ayg0Z=4rq2LWOpYE4xTaMw@mail.gmail.com>
 <CAC=eiqy1_-atsKHX4SE0a_KS1b_qJdzzihr+emoSSY0RDco1mQ@mail.gmail.com>
 <20111106143846.46fa1d9b@skate>
 <CAC=eiqwhb=ZknTvjhHPquZ-hhtf6u50vNYn6Nc_EPp-ydMtCkQ@mail.gmail.com>
 <20111106162606.491d895c@skate>
 <CAC=eiqyLq=uBboFLHDNM=ph4m8aOHcZN8799BL+5arheYLbeHw@mail.gmail.com>
 <20111106170605.41259586@skate>
 <CAC=eiqz2Yy=Q0WYjZVbP4FsBFpTBEcg4BdBUFbeH-Kdn4TLpjA@mail.gmail.com>
Message-ID: <CAC=eiqzORpB4Att=NWsD+6tdbDV=cOSWN-ytCpQ93yTNDfzP7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 6, 2011 at 11:09 PM, Daniel Potapov <yeso@bk.ru> wrote:
>> Buildroot generates it. Please do "make clean; make" to rebuild from
>> scratch. EABI vs. OABI is a global toolchain option, so you need to
>> rebuild everything.
>
> Thank you, I'll try!
>

My problem is solved after rebuilding with EABI ! Thanks a lot for help!


-- 
Best regards,
Daniel
