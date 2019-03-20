From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 23:31:15 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/libfuse: Install udev rules
 and set permissions
In-Reply-To: <20190315133033.5275-2-norbert.lange@andritz.com>
References: <20190315133033.5275-1-norbert.lange@andritz.com>
 <20190315133033.5275-2-norbert.lange@andritz.com>
Message-ID: <5fa39c93-ea93-e1a2-1d3b-0d97352ecd0c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/03/2019 14:30, Norbert Lange wrote:
> This fixes some omissions from the installation.
> 
> Install the udev rules.
> 
> Tell buildroot about the fuse device.
> 
> Apply setuid permissions on the fusermount tool.
> 
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>

 Applied to master, thanks.

 Regards,
 Arnout
