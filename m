From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 05 Jun 2012 10:34:57 +0200
Subject: [Buildroot] generated shared libraries are not ARM but Intel -
 why ?
In-Reply-To: <CAGXs5wVbNYCBbrpRJAx+ETKsK_amRjZ42gZKK5BhX3Li=F9_uw@mail.gmail.com>
References: <CAGXs5wWx3-kTe9T5OQDLqfh80K9hz0OOkkqT+aNKYjQhjRbn3g@mail.gmail.com>
 <4FCD3FEF.40001@mind.be>
 <CAGXs5wVbNYCBbrpRJAx+ETKsK_amRjZ42gZKK5BhX3Li=F9_uw@mail.gmail.com>
Message-ID: <4FCDC4B1.6060502@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kevin Wilson wrote:
> Hi,
> Thanks for your quick response !
> I tried again , deleting that tree and untarring the zip file
> again, Now it is ok !
> rgs
> Kevin

Next time you need to clean the tree you can just call
make clean
instead of deleting and extracting the tar file again.

This way you will not loose your local modifications and configuration.

Luca
