From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Oct 2015 09:05:47 +0200
Subject: [Buildroot] [PATCH v1] gst1-plugins-bad: update configure
	options
In-Reply-To: <1444774091-19539-1-git-send-email-ps.report@gmx.net>
References: <1444774091-19539-1-git-send-email-ps.report@gmx.net>
Message-ID: <561DFECB.2020009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-10-15 00:08, Peter Seiderer wrote:
> - add new onvif option
> - add new dtls option
> - add new openh264 option
> - add new x265 option
> - rename real option to rtp
> - remove legacy options: directdraw, osx_video, quicktime
>   and mythtv
> - add '--disable-bs2b' and '--disable-libde265' to options
>   which require currently unpackaged libraries
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> ToDo: handle new '--disable-gtk3' and '--disable-qt' options

 If you don't handle them now (or plan to do so in the very near future), then
explicitly disable them for the time being. This helps for reproducible builds.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
