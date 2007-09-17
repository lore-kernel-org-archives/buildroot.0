From: Erik Andersen <andersen@codepoet.org>
Date: Mon, 17 Sep 2007 14:14:01 -0600
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <46EED912.2070902@free.fr>
References: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>
	<46EED912.2070902@free.fr>
Message-ID: <20070917201401.GA28671@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon Sep 17, 2007 at 09:44:18PM +0200, Julien Boibessot wrote:
> Hi,
> 
> pasteur a ?crit :
> > any idea about ipkg integration with buildroot ? Like openwrt...
> >   
> I have started to integrate it for a project I'm co-driving but from my 
> understanding it will require to modify each package's makefile to 
> explicitly call "ipkg stuff" after having installed the package's files 
> in TARGET_DIR.
> 
> Do you have a better idea ?

I've thought about this before.  If each package has its
own target directory, then a packaging tool could simply
package up the content of that package specific target
directory as the package content.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
