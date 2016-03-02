From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 23:51:10 +0100
Subject: [Buildroot] [PATCH 3/4] Add go target support
In-Reply-To: <22da8d19ae88ef56544a26541228319c78ae8dea.1456946494.git.geoff@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
 <22da8d19ae88ef56544a26541228319c78ae8dea.1456946494.git.geoff@infradead.org>
Message-ID: <20160302235110.7fe169b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Geoff Levand,

On Wed, 02 Mar 2016 19:23:33 +0000, Geoff Levand wrote:
> Add the needed bits to build a go compiler for the target.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>

We don't support or want to support doing development on the target, so
I think the target variant of the go compiler is not needed.

See
https://buildroot.org/downloads/manual/manual.html#faq-no-compiler-on-target
for more details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
