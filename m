From: ratbert90 <aduskett@gmail.com>
Date: Thu, 12 Oct 2017 18:56:31 +0000 (UTC)
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
	file.
In-Reply-To: <20171012180819.GI7617@waldemar-brodkorb.de>
References: <20170715114432.0b01a373@windsurf>
 <87d191afyw.fsf@dell.be.48ers.dk> <20170715214809.2158c3e2@windsurf>
 <87inis8jjj.fsf@dell.be.48ers.dk>
 <20170716164353.GI1482@waldemar-brodkorb.de>
 <246b2393-ffd3-99e5-5de9-db52d73488bb@mind.be>
 <20170718230641.479308e9@windsurf>
 <20170718210704.GO1482@waldemar-brodkorb.de>
 <1507770391.3839.67.camel@synopsys.com>
 <20171012095248.1c9839a8@windsurf.lan>
 <20171012180819.GI7617@waldemar-brodkorb.de>
Message-ID: <1D00506707BCA53D.bdbb4a67-0598-4100-9777-df65bf06dec8@mail.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just throwing my two cents in again:




If uClibc is the default c library, denying users the ability to use SELinux isn't very nice.? Even more so when going to uclibc-menuconfig and enabling fts.h still doesn't allow them to enable it. 




The more devices that use SELinux the better in my opinion.









On Thu, Oct 12, 2017 at 2:08 PM -0400, "Waldemar Brodkorb" <wbx@openadk.org> wrote:










Hi,
Thomas Petazzoni wrote,

> > 3. Regarding purity of standards I may agree that we as more knowledgeable
> > ? ?engineers need to educate our users and resist temptation to return to
> > ? ?deprecated things. But as an advocate of my users I'd say that usability
> > ? ?and support of wider packages might be even more important.
> 
> Yes, I agree that there is a balance between "purity" and "pragmatism".
> 
> I don't have a very strong opinion on this FTS enabled or not. I don't
> remember the size measurements with FTS enabled/disabled. Perhaps we
> should just enable all features needed by Buildroot packages in our
> uClibc configuration.

That would be indeed the best policy!

And I don't think a lot is missing. May be just FTS!

best regards
 Waldemar





-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171012/ed3677fd/attachment.html>
