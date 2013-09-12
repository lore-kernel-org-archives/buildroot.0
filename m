From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 12 Sep 2013 12:54:48 -0500
Subject: [Buildroot] Building Manual Errors
In-Reply-To: <CAAXf6LW8Gfc_Skos1YbpPbt+G9B-qpU3_6sV4xe1mFSDHLA04Q@mail.gmail.com>
References: <OF433C040C.2486075F-ON86257BE2.00813B52-86257BE2.0082DB6E@rockwellcollins.com>
 <CAAXf6LWJ8DM-UBfEi=quWo7g-g_RGSYuRgEJM_y__mh+10F3pQ@mail.gmail.com>	<OF56171A80.616C14AA-ON86257BE4.0059D6AD-86257BE4.005A710F@rockwellcollins.com>
 <20130912183745.64503913@skate>	<CAAXf6LXS_9G=329VecwOD8hd9x+DD8+6O96o7xPn2jZi6s2iAg@mail.gmail.com>
 <20130912185609.4e04fb9b@skate>
 <CAAXf6LW8Gfc_Skos1YbpPbt+G9B-qpU3_6sV4xe1mFSDHLA04Q@mail.gmail.com>
Message-ID: <OF852DA38D.01A2571D-ON86257BE4.0061D76D-86257BE4.006266D9@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas(es) -

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 09/12/2013 
12:02:45 PM:

> On Thu, Sep 12, 2013 at 6:56 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Thomas De Schampheleire,
> >
> > On Thu, 12 Sep 2013 18:51:22 +0200, Thomas De Schampheleire wrote:
> >
> >> I agree with this.
> >> But I do think that it would be nice to check for missing
> >> dependencies, being asciidoc and w3m.

Didn't really think about the dependancies or the black hole that this 
would imply. I satisfied with just adding these checks and documenting 
a know working configuration.

> > Agreed, but they should only be checked when the user actually tries 
to
> > build the documentation. I don't want to make these additional
> > mandatory dependencies.
> 
> Yes, fully agreed.
> Anyone volunteering to make a patch for this? If not, I'm willing to
> do this, but as time permits.

I don't think I would have time to put the checks into the scripts. With
not being familiar with these it would be a time consuming addition.
However, when I'm updating the documentation for SELinux stuff I can add 
a known working configuration to the manual for my system and the 
versions too.

Thanks,
-Ryan

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130912/87c242f7/attachment.html>
