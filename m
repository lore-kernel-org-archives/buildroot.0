From: Fabien Marteau <lepingouin.tux@gmail.com>
Date: Thu, 29 Jan 2009 09:36:34 +0100
Subject: [Buildroot] Mysql error with Buildroot
In-Reply-To: <8ebba8c20901290015u199c2ad8r66ef36339ae1d099@mail.gmail.com>
References: <8ebba8c20901290015u199c2ad8r66ef36339ae1d099@mail.gmail.com>
Message-ID: <ce62e9d00901290036r3b7649e3s748b7821c7ab1f4b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I has the same problem, to solve it I just made link on library :

cd /usr/lib
ln -s mysql/libmysqlclient.so.16

And it's work, but it's not very clean patch ;-)

FabM

On Thu, Jan 29, 2009 at 9:15 AM, Mitesh Gupta <guptamitesh@gmail.com> wrote:
> Hi,
> I was able to add mysql client successfully with buildroot. However after
> booting into the system and  trying to start mysql I am getting the
> following errors " can't load library 'libmysqlclient.so.16' ".
> Any help? I think issue is with how mysql is configured.
> Thanks
> Mitesh
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
