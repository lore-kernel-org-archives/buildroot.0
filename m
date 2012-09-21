From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 21 Sep 2012 09:17:29 +0100
Subject: [Buildroot] [PATCH v5] sconeserver: new package
In-Reply-To: <505A3D93.3040709@mind.be>
References: <1348044562-6762-1-git-send-email-spdawson@gmail.com>
 <505A3D93.3040709@mind.be>
Message-ID: <CAHt8ZCMTfVHVxgKqfbfmoDgM9t-MNqaE9eTYS9ogawsB8daSNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 September 2012 22:48, Arnout Vandecappelle <arnout@mind.be> wrote:
>  I tried building the mysql module and it also fails to find mysql.h.  Turns
> out that the configure script hard-codes -I/usr/include/mysql instead of
> using
> the sysrooted path.  I'm not sure how to fix it elegantly.  Adding a -I
> option to the CXXFLAGS works, but you still get a -I/usr/include/mysql which
> may cause problems...

Thanks for your help with this Arnout; much appreciated. I'll
incorporate your ideas and submit an updated patch.

Simon.
