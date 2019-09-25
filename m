From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Sep 2019 15:00:27 +0300
Subject: [Buildroot] [git commit] package/iptables: bump to version 1.8.3
In-Reply-To: <87impo1fui.fsf@dell.be.48ers.dk>
References: <20190703215603.AB1EE8270C@busybox.osuosl.org>
 <87impo1fui.fsf@dell.be.48ers.dk>
Message-ID: <87k19woaas.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Sep 19 2019, Peter Korsgaard wrote:

>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
>
>  > commit: https://git.buildroot.net/buildroot/commit/?id=326a9ae2e5cd1e13abd1ea3de2a17909086e221c
>  > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>  > Drop upstream patches.
>
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> Committed to 2019.02.x and 2019.05.x as this fixes a buffer overflow in
> iptables-save parsing.

This requires the libnftnl bump to 1.1.3 as well, for both 2019.02.x and
2019.05.x (master commit 1208e41561da7). iptables build currently fails
when libnftnl is enabled.

  http://autobuild.buildroot.net/?reason=iptables-1.8.3

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
