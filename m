From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 08:21:10 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-09-22
In-Reply-To: <20150923063019.57F001018BE@stock.ovh.net>
References: <20150923063019.57F001018BE@stock.ovh.net>
Message-ID: <560252E6.8000501@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 23/09/15 07:30, Thomas Petazzoni wrote:
> Build statistics for 2015-09-22
> ===============================
>
>      mips64el |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/269c7056285b4f32e6d0857392107375983b49b0/

Should be fixed by:

https://patchwork.ozlabs.org/patch/502988/

I will test it today.

>           sh4 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/35425866b47da273d0bf44292c6b7fa0b52b4c89/
>       powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/d8a539b470fbc8bd86ae92d04442c4207e3848cf/
>       powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/d4230407d7ab14acb4ceb29921bb84ff4027cc33/
>        x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/5953592fb25400b484310daed384c8b5cb269581/
>           arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/4bf43f6ce1e3eda2e0357905bf58590a04a315d9/
>          i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/1394dee1565d4fffebdcd3b0c7e6271b09721547/
>       powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/3f7353e2cfde51b9c3b7903d2ca4403a4b831ebb/
>           arc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/41362050b3c54b1e1910e5bcbe88b2129a71fdb0/
>       powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/30bf6a3380dd2ecddac29d9c286932a6a8e46322/
>          mips |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/49926ed2ce8f4ceca3dd650b80661c7f93c0027d/
>           arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/f533f53bdddb816a37323dddfafcff9de59a64fe/
>          i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/af46bf1199fd1d76dcfbabad020893880ca4ce68/
>          i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/33156ef05a8a3ef72f6e5c4e2eed16cff98ee359/
>      mips64el |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/ae33925815165d985c84577bc9431f04342c3090/
>        x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/c01faded797993c00b30e3228eb74766d1ef1d79/
>        x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/6bd392edd8e15ed2725bf606886330cfc793194b/
>        xtensa |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/c4eb82e507e63a38f5e15ee07c6d17657597dd1a/
>        x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/a197fbab98c63efb228c87cc86023b9885d92c00/
>        x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/42e24329ee669a9e09e66c91e3b6917eb421a608/
>        xtensa |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/1f146be2ba0801e4e5a6154f85558f3affc4b112/
>          sh4a |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/8ebdd1581f42aacaf011d9b1c2e7e4b5d0a34b8b/
>           arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/e5c72588536f9af5a6ee89a7706d832dce0a6fcf/
>        xtensa |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/0088ec43cbd04a52ecaecceea02d088b98b87be1/
>           arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/620aad0513d1173a2e726ab07ff22703f64664b5/
>       aarch64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/d84e5445c17e90c11f18d4076c1fa3b3f268c395/

Fixed by:

https://patchwork.ozlabs.org/patch/520274/

Regards,

Vincent.
