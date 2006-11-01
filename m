From: Ashwin Bihari <abihari@gmail.com>
Date: Wed, 1 Nov 2006 10:41:02 -0600
Subject: [Buildroot] Persistent tarball repository
In-Reply-To: <loom.20061101T171522-277@post.gmane.org>
References: <loom.20061101T151612-639@post.gmane.org>
	<1162394701.2945.4.camel@iridium.gnat.ca>
	<loom.20061101T164136-413@post.gmane.org>
	<1f11a5490611010801o629294ffw7cde4e3f98778d16@mail.gmail.com>
	<loom.20061101T171522-277@post.gmane.org>
Message-ID: <1f11a5490611010841n3a71baeei8d55aa4dc7251330@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/1/06, MikeW <mw_phil@yahoo.co.uk> wrote:
>
> Yes - I think my issue is that the downloads are held 'within' the
> buildroot
> tree, hence the semantics of distclean as you describe them mean that they
> must go.
>
> If they were outside the buildroot tree, then I guess distclean ought not
> to clear them out.
>
> Wonder if that's the making of a patch - only 'distclean' delete
> downloaded tarballs if they occur under the buildroot directory;
> but currently there's no menuconfig option to say where downloads are kept
> ...
> however at the moment I just want something that 'works out of the box'!
>
> Thanks,
> MikeW
>

Mike,

By all means provide a patch that allows you to change the location of the
DL directory and whether or not it should be deleted during a distclean. I
would definitely find it useful and if others agree, it might get committed.

Regards

-- 
~ Ashwin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061101/d24358a4/attachment.htm 
