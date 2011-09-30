From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Sep 2011 15:50:07 +0200
Subject: [Buildroot] User-enabled host packages?
In-Reply-To: <CAAXf6LXg7yo9n3fjhE4Qx6ve1Oh9_JcqFZ4HTrCfubFEg7nhZg@mail.gmail.com>
References: <4E79E001.7010409@lucaceresoli.net> <20110923094636.030653fe@skate>
 <CAAXf6LXg7yo9n3fjhE4Qx6ve1Oh9_JcqFZ4HTrCfubFEg7nhZg@mail.gmail.com>
Message-ID: <201109301550.08708.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 30 September 2011 14:50:03, Thomas De Schampheleire wrote:
> I'm currently in need of the dtc compiler, which is only really
> relevant to the host. I followed the approach suggested above of a
> Config.in.host file that includes the appropriate dtc/dtc.mk file.
> Config.in.host is then included from the top-level Config.in.
> I can submit a patch with this if you like.

 I like!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110930/71b6c749/attachment.html>
