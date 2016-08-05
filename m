From: daggs <daggs@gmx.com>
Date: Fri, 5 Aug 2016 07:29:15 +0200
Subject: [Buildroot] dri2.h needed but missing
In-Reply-To: <4b622cd4-fa9d-1b6b-9d33-7c7397800ce1@gmail.com>
References: <trinity-c313bacc-e685-4046-81aa-0a8a97915dc9-1470338357069@3capp-mailcom-bs11>,
 <4b622cd4-fa9d-1b6b-9d33-7c7397800ce1@gmail.com>
Message-ID: <trinity-5e2193c5-6d63-4682-8d45-8ca0f0bedfb4-1470374955326@3capp-mailcom-bs14>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> On 8/4/16 12:19 PM, daggs wrote:
> > Greetings,
> > 
> > I need the file mentioned above for a package I want to add, I cannot seem to find it under xorg's installed headers, any idea why and how I can add it?
> >
> 
> you need to depend on xserver-xorg
> 

I did that of course, xorg-server is installed, that header however isn't.

Dagg.
