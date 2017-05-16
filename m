From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 May 2017 21:01:16 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-04
In-Reply-To: <20170505132423.3602e294@free-electrons.com>
References: <20170505062802.8C0262097E@mail.free-electrons.com>
 <20170505132423.3602e294@free-electrons.com>
Message-ID: <20170516210116.140c9c63@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 5 May 2017 13:24:23 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
 
> >          arm |           qt5declarative-5.8.0 | NOK | http://autobuild.buildroot.net/results/64a198397736db12b73c1f693dbe1c47d73b53da |     
> 
> logo.h:52:11: error: 'GLfloat' does not name a type
>      const GLfloat *constData() const { return m_data.constData(); }
> 
> Peter, an idea ?
> 
> There's no OpenGL backend enabled in this configuration.
> 

Should be fixed by [1], do not compile examples which depend on a OpenGL backend...

Regards,
Peter


[1] https://patchwork.ozlabs.org/patch/763122/
