From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 12:59:25 +0200
Subject: [Buildroot] Package naming convention [was: Re: [PATCH 1/2]
 scanpypi: new utility]
In-Reply-To: <55A66B64.5090603@mind.be>
References: <916572081.3104684.1436969298786.JavaMail.root@openwide.fr>
 <55A66B64.5090603@mind.be>
Message-ID: <20150808125925.66e32bfb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 15 Jul 2015 16:17:08 +0200, Arnout Vandecappelle wrote:

>  Good question, we indeed have no real convention of what the buildroot name is
> for packages with weird characters.
> 
>  Actually, we do: keep the upstream name as much as possible. So python-webpy,
> for instance, keeps the upstream webpy name (note that the upstream name is
> webpy, even though the package is identified in PyPI as web.py. PyPI isn't very
> consistent either). For zope.interface, I actually see no reason not to keep the
> upstream name, so the package really should have been called
> python-zope.interface IMHO.
> 
>  What do the others think?

I missed this message. On my side, I would prefer to not have a
package named python-zope.interface. It should be named
python-zope-interface instead. I.e all weird characters should be
replaced by '-' in package names.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
