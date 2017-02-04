From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Feb 2017 15:24:30 +0100
Subject: [Buildroot] Checking the size of the output images
In-Reply-To: <CAF_dkJBqGLEdB3q3qKNK+Nk0-SkY4dSz_g3j9XVnmwvpwAeRPA@mail.gmail.com>
References: <CAF_dkJBqGLEdB3q3qKNK+Nk0-SkY4dSz_g3j9XVnmwvpwAeRPA@mail.gmail.com>
Message-ID: <20170204152430.3a35dff4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Feb 2017 09:17:13 -0500, Patrick Doyle wrote:
> Is there a buildroot standard way to check the size of the zImage file
> produced to ensure that it will fit in a particular flash partition?
> 
> I can invent one, but I'd rather follow existing examples, and it
> seems to me that this should probably be a common enough scenario that
> others have already address it.

I guess you can simply write a post-image script that does whatever
checks you want on the images produced by Buildroot (including making
sure the image size is below a given value).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
