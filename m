From: Robert Nelson <robert.nelson.work@gmail.com>
Date: Thu, 01 May 2008 10:55:43 -0500
Subject: [Buildroot] What is the best way to deactivate XML Parser
 (expat) for ARM build?
In-Reply-To: <326f33790805010751v24facd35o4207041c297da12c@mail.gmail.com>
References: <326f33790805010751v24facd35o4207041c297da12c@mail.gmail.com>
Message-ID: <4819E7FF.5000902@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-- added CC to Buildroot List

Hi Arun,

I've recently run into this too...  for some reason the expat dependency 
isn't properly built with the default at91sam9263_defconfig.  Until this 
gets fixed upstream, I've been issuing an "make expat" after the error 
first occurs, this moves the generated libexpat into the correct 
directory.. After which the build process will continue till the next 
error. (checking for GLIB - version >= 2.2.0... no)

Robert Nelson
FAE - Digi-Key

Arun Reddy wrote:
> I have been stuck for quite a few days on a problem dealing with the 
> build process failing because it cannot find the XML Parser library 
> libexpat. I was wondering is this even necessary for the build to 
> complete? Can I deactivate it? It seems my problem is very unique and 
> no other people have encountered it when doing an ARM build, so how 
> did you guys deactivate the XML Parser?
>
> Thank you.
