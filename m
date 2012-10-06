From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Oct 2012 14:37:13 +0200
Subject: [Buildroot] [PATCH v8 01/11] host-qemu: new package
In-Reply-To: <20121005091950.5833bed7@skate>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <20121004223334.64e74a6f@skate>
 <CA+-urNSi+VTS93wP5cEFuLwZn7SCKawpDp6XR6OLqumofBXJyA@mail.gmail.com>
 <20121005091950.5833bed7@skate>
Message-ID: <507025F9.4010001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/10/12 09:19, Thomas Petazzoni wrote:
> Sure. But for example the Kconfig help text was mentioning system mode
> emulation, even though the current package didn't support it. My point
> was: for the sake of building Perl, we don't need to have host-qemu in
> Kconfig, so let's not do this, and keep the focus of the patch set.
>
> Fran?ois has already done 8 versions of this patch set, and I am pretty
> sure he wants to see it merged. And the best way to see a patch set
> merged is to remain absolutely focused on the problem you're trying to
> solve, and not to solve a gazillions of other unrelated problems at the
> same time.

  I don't think having the Kconfig there will stop qemu being included.
There's just one more sentence needed: "Buildroot currently doesn't support
building qemu for system mode emulation".

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
