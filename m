From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 00:03:32 +0100
Subject: [Buildroot] [PATCH v2 2/2] tesseract-ocr: new package
In-Reply-To: <ecfe5b92-0800-cb5c-3f22-53448c1255f9@mind.be>
References: <1489910873-8450-1-git-send-email-gilles.talis@gmail.com>
 <1489910873-8450-3-git-send-email-gilles.talis@gmail.com>
 <20170319145455.27ceaa84@free-electrons.com>
 <ecfe5b92-0800-cb5c-3f22-53448c1255f9@mind.be>
Message-ID: <20170320000332.6e5e9983@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 00:00:27 +0100, Arnout Vandecappelle wrote:

> >  * Since the list of languages is quite long, having an explicit option
> >    for each of them is a bit annoying. So I looked into turning your
> >    one-option-per-language idea into a single option with a space
> >    separated list of languages. Except that we anyway need to have the
> >    hash file for each language in tesseract-ocr.hash.  
> 
>  That's why we have BR_NO_CHECK_HASH_FOR, no?

True. But then we don't check hashes for stuff downloaded through
Github, which potentially could change (hence the reason why I'm also
suggesting to have a package that downloads all of the tessdata
package, but it's huge).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
