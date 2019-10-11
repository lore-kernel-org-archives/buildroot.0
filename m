From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:11:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 fix opengl dependency
In-Reply-To: <312a6778-7ae2-7f6c-ce88-5df644d501d2@mind.be>
References: <20190807215804.100437-1-james.hilliard1@gmail.com>
 <20190816000232.6c7f88b8@windsurf.home>
 <CADvTj4pTQJAJ6R=0UKBW6ZPVT3A36USdGYcyn-G0e-3L-3M=gQ@mail.gmail.com>
 <20190816143142.3653b7ea@windsurf.home>
 <CADvTj4pyp2f2YT_jECf07VCzHjdCXbYkowHGYWTvtXwtwR_x7w@mail.gmail.com>
 <312a6778-7ae2-7f6c-ce88-5df644d501d2@mind.be>
Message-ID: <43f1019d-e1f2-eb88-10f0-faf18445d247@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/10/2019 00:11, Arnout Vandecappelle wrote:
[snip]
>  I suspect that what is actually needed is that gst1-plugins-base is configured
> with -Dgl=enabled. Therefore, after 4164d31e05 which I just applied, I think the
> condition should actually be on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API.
> 
>  Could you test with the defconfig that Thomas provided and
> BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLES2 if the build of WPE succeeds?

 BTW I've marked this patch as Changes Requested.

 Regards,
 Arnout
