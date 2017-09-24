From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 16:14:02 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/pulseaudio: bump version to
 11.1
In-Reply-To: <20170919173542.27800-1-bernd.kuhls@t-online.de>
References: <20170919173542.27800-1-bernd.kuhls@t-online.de>
Message-ID: <05621d99-c33a-6ef7-b9c4-9f1c33ba999a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-09-17 19:35, Bernd Kuhls wrote:
> Dependency to json-c was dropped, updated reverse dependencies as well
> and added optional dependency to libatomic_ops
> https://cgit.freedesktop.org/pulseaudio/pulseaudio/tree/configure.ac#n250
> when __sync_bool_compare_and_swap is not available.
> 
> Removed patch applied upstream:
> 0002-webrtc-C-11-is-only-required-for-WebRTC-support.patch
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks. I don't think it was really needed to introduce
BR2_PACKAGE_PULSEAUDIO_ENABLE_ATOMIC but I didn't feel like messing with it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
