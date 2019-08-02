From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Aug 2019 18:58:19 +0200
Subject: [Buildroot] pb host-pkg-config 0.25
In-Reply-To: <CAMucF0SAs=GpM1iSdhwxDqi6rjQri2ynPye_hW7SiyrGgnvOYw@mail.gmail.com>
References: <CAMucF0SAs=GpM1iSdhwxDqi6rjQri2ynPye_hW7SiyrGgnvOYw@mail.gmail.com>
Message-ID: <3cb686e6-7d4b-6731-7b11-d44be0f2fdfc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Haithem,

On 02/08/2019 17:54, Haithem Ben Abdelaziz wrote:
> Le dpkg de host-pkg-config 0.25 g?n?re ces errors: (suite au changement de
> versions os linux):

 host-pkg-config was removed from Buildroot in 2012, so it looks like you're
using an ancient Buildroot version. We can't really help you with that. Please
switch to a recent Buildroot (2019.02.x), or (probably more practical) do your
builds in an old OS container.

 Regards,
 Arnout

> 
> 
> collect2: error: ld returned 1 exit status
> Makefile:479: recipe for target 'testglib' failed
> make[6]: *** [testglib] Error 1
> make[6]: *** Waiting for unfinished jobs....
> Makefile:476: recipe for target 'testgdateparser' failed
> make[6]: *** [testgdateparser] Error 1
> 
> collect2: error: ld returned 1 exit status
> Makefile:473: recipe for target 'testgdate' failed
> make[6]: *** [testgdate] Error 1
> Makefile:554: recipe for target 'all-recursive' failed
> make[5]: *** [all-recursive] Error 1
> Makefile:389: recipe for target 'all' failed
> make[4]: *** [all] Error 2
> Makefile:577: recipe for target 'all-recursive' failed
> make[3]: *** [all-recursive] Error 1
> Makefile:342: recipe for target 'all' failed
> make[2]: *** [all] Error 2
> package/pkg-generic.mk:158 <http://pkg-generic.mk:158>: recipe for target
> '/home/g361240/SSD/hd_debug/build/hot/build/host-pkg-config-0.25/.stamp_built'
> failed
> make[1]: ***
> [/home/g361240/SSD/hd_debug/build/hot/build/host-pkg-config-0.25/.stamp_built]
> Error 2
> 
> How can we resolve that, configuration options .. ?
> thank you in advance
> 
> ha?them
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
