From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:46:46 +0100
Subject: [Buildroot] [PATCH] support/script/scancpan: generate hash file
In-Reply-To: <1416512127-9789-1-git-send-email-francois.perrad@gadz.org>
References: <1416512127-9789-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20141122194646.06094ed9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu, 20 Nov 2014 20:35:27 +0100, Francois Perrad wrote:
> retrieve md5&sha256 from metacpan.org, and store them in the hash file
> for each package.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks, I've applied your patch to the next branch, after removing the
odd indentation for the md5 case, as noted by Peter.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
