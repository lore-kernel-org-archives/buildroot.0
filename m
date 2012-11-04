From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 20:02:34 +0100
Subject: [Buildroot] [PATCH] lua: remove shared library feature
In-Reply-To: <CAGhdn56HngpQGgFX4ax3cbGO23yXN7WWto35yYDneUODpcO0Pg@mail.gmail.com>
References: <1352032995-1850-1-git-send-email-arnout@mind.be>
 <CAGhdn56HngpQGgFX4ax3cbGO23yXN7WWto35yYDneUODpcO0Pg@mail.gmail.com>
Message-ID: <5096BBCA.9010707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/04/12 15:24, Fran?ois Perrad wrote:
> 2012/11/4 Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>:
>> >  The shared library is a feature we added to lua, but it doesn't work
>> >  correctly.  Since we anyway normally don't add features to packages,
>> >  just remove all the support for the shared library.
>> >
>> >  Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>> >  ---
>> >  Francois, Gustavo, could you review and Ack this patch please?  You're
>> >  more or less the lua maintainers...
> NACK, for this patch.
>
> The problem is the option BR2_PACKAGE_LUA_SHARED_LIBRARY,
> not the added feature of shared library.
> See my patches serie (2012 Sep 4) :
> [4/5] lua: remove 3 sub-options, always install all
> (http://patchwork.ozlabs.org/patch/181504/)
> [5/5] lua: refactor without useless define's
> (http://patchwork.ozlabs.org/patch/181505/)
>
> note: these 2 last patches could be applied without the 3 first.

  OK, thanks for the reminder, and sorry it took so long to accept them.

  FYI we decided to accept patches more aggressively in the future, so it
will hopefully not take such a long time anymore.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
