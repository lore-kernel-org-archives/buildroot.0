From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 18:47:25 +0200
Subject: [Buildroot] [PATCH 1/1] python: fix readline extension
 compilation with readline 6.3
In-Reply-To: <1397684923-30579-1-git-send-email-vsergeev@kumunetworks.com>
References: <1397684923-30579-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <20140420184725.3dc54660@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivan Sergeev,

On Wed, 16 Apr 2014 14:48:43 -0700, Ivan Sergeev wrote:
> Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
> ---
>  package/python/python-012-fix-readline-6.3.patch | 34 ++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/python/python-012-fix-readline-6.3.patch

Applied, thanks. We really should work on improving the Python stuff to
make it abort the build if a module fails to build.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
