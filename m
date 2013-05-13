From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 May 2013 00:46:15 +0200
Subject: [Buildroot] [PATCH v4 0/7] Gstreamer 1.X patch series
In-Reply-To: <CAEBucnCLJSpcC4QNnc4=qKJz7_hcVodAjkmiNdHucQW7B3_GTg@mail.gmail.com>
References: <1368468241-23319-1-git-send-email-spenser@gillilanding.com>
 <20130513202900.5ffa3bd2@skate>
 <CAEBucnCLJSpcC4QNnc4=qKJz7_hcVodAjkmiNdHucQW7B3_GTg@mail.gmail.com>
Message-ID: <51916D37.3000907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/05/13 20:59, Spenser Gilliland wrote:
[snip]
> In addition, the glib patches I have made are a requirement for
> building gstreamer 1.0.7.  The minimum glib version to support
> gstreamer 1.0.X is 2.32.0. The patch i made is for 2.36.1 (latest
> stable).

  Then you should include the glib patches in this series. Otherwise, 
someone who wants to test it will fail and you'll never get an Ack.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
