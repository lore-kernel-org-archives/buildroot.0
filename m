From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jul 2014 20:18:56 +0200
Subject: [Buildroot] [v2 2/3] perl-net-ssleay: fix build
In-Reply-To: <1404406406-9209-2-git-send-email-francois.perrad@gadz.org>
References: <1404406406-9209-1-git-send-email-francois.perrad@gadz.org>
 <1404406406-9209-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140703201856.4297a50d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu,  3 Jul 2014 18:53:25 +0200, Francois Perrad wrote:
> set the correct prefix, instead of '/usr' detected on the host
> 
> see http://autobuild.buildroot.net/results/135/135867ef85535863e3647cc5fb82accb6f77612c/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Again, sorry to be annoying, but please, please, please, better commit
logs. The title should be more something like:

perl-net-ssleay: specific correct OpenSSL prefix to fix build

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
