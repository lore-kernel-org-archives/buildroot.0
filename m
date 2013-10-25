From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 25 Oct 2013 18:46:35 +0200
Subject: [Buildroot] [RFC] pkg-python infrastructure
In-Reply-To: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
References: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
Message-ID: <f4e75980-2ff3-4edf-88a3-866abaad9ad1@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan Barnett <rjbarnet@rockwellcollins.com> wrote:
>A while back (about a week ago) - Gustavoz Zacarias, Thomas Petazzoni, and 
>myself - were having a conversation on the IRC about creating a new 
>package type for handling the builds of python packages. If I recall 
>correctly, this is what we discussed. I would like to just have some 
>record on how we want to handle building python packages.
>
>Thomas P and Gustavoz - please correct/expand on any points that I may be 
>missing.
>
>pkg-python infrastructure
>-------------------------
>
> * Would add a new makefile defining generic build steps for python 
>packages under package/pkg-python.mk.
>
> * Would support building for Python 2.7 and Python 3+.
>
> * Would ensure that cross-compiling of python packages is handled 
>correctly.
>
> * Would support setup.py and setuptools packages.
>
>I don't know when I will be able to get around to doing this but I would 
>like to at least capture the points that were made. Also anyone else is 
>welcome to pick up this work too :)

FWIW, I'm definitely in favor of such an infrastructure...

Best regards,
Thomas
