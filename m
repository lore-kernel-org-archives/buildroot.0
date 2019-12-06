From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri, 6 Dec 2019 15:20:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: add support for
 Hyper-V tools
In-Reply-To: <20191206151712.4a3ea674@windsurf>
Message-ID: <3683881315-31837@mail.unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com> 

 To:   Simon Rowe <simon.rowe@eu.citrix.com> 
 Cc:   Simon Rowe <simon.rowe@citrix.com>, <buildroot@buildroot.org>, Yann E. MORIN <yann.morin.1998@free.fr>, Pascal de Bruijn <p.debruijn@unilogic.nl> 
 Sent:   12/6/2019 3:17 PM 
 Subject:   Re: [Buildroot] [PATCH 1/1] package/linux-tools: add support for Hyper-V tools 

Hello, 
 
+Pascal in Cc. 
 
On Fri, 6 Dec 2019 13:33:50 +0000 
Simon Rowe <simon.rowe@eu.citrix.com> wrote: 
 
> What's the probability of that, someone else just sent a patch 15  
> minutes ago while I was testing this one, 
 
Pascal: the approach of Simon is to have a single option to 
build/install all tools. Do we really need one option per tool like you 
implemented? In which use cases would only a subset of the tools be 
needed? What is the installed size of each tool? 


The size of each tool is very limited, so that's at best a secondary concern.



But for example the fcopy service basically gives the virtualization host provider direct access to the guest filesystem., which is not something everybody may want to actively facilitate.


Having these different services nicely separated out, is specifically one of the nice things opposed to VMware's openvmtools/vmtoolsd.



Regards,
Pascal de Bruijn


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191206/6d69a562/attachment.html>
