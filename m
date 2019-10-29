From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 21:27:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/proj: add SQLITE3_LIBS to
 proj.pc.in
In-Reply-To: <20191020092038.2422-1-fontaine.fabrice@gmail.com>
References: <20191020092038.2422-1-fontaine.fabrice@gmail.com>
Message-ID: <e90455d9-1f96-a5cb-1cc0-c336e4d7cd88@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/10/2019 11:20, Fabrice Fontaine wrote:
> This will fix a static build failure with libgeotiff
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/737db533c16f285a02118ab048e8427d3e35803d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks. I added a note that it was merged upstream.

 Regards,
 Arnout
