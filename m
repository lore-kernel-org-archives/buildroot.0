From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 20:45:27 +0200
Subject: [Buildroot] [git commit] package/assimp: depends on libzlib
In-Reply-To: <20210520191635.9A5E58889C@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Thu, 20 May 2021 21:45:23 +0200")
References: <20210520191635.9A5E58889C@busybox.osuosl.org>
Message-ID: <87wnrp2ss8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=8f11388f4e60df88ffb210079f412736160474a5
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > assimp doesn't build with zlib-ng because Z_EXPORT and z_crc_t are used
 > by the bundled unzip source code

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
