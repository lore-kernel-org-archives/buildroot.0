From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 22:55:52 +0200
Subject: [Buildroot] [PATCH] qt5: Need pcre with UTF support
In-Reply-To: <1405526707-32091-1-git-send-email-jezz@sysmic.org>
References: <1405526707-32091-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140727225552.64fe50e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Wed, 16 Jul 2014 18:05:07 +0200, J?r?me Pouiller wrote:
> Enabling PCRE16 is not enough for Qt5. PCREUTF is also necessary, else
> Qt5 may complain with this kind of (non fatal) message:
>   QRegularExpressionPrivate::doMatch(): called on an invalid QRegularExpression object
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/qt5/qt5base/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
