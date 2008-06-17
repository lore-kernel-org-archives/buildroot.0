From: Luigi 'Comio' Mantellini <luigi.mantellini@idf-hit.com>
Date: Tue, 17 Jun 2008 15:24:35 +0200
Subject: [Buildroot] patches support gcc4.3
In-Reply-To: <20080617091112.GF25428@mx.loc>
References: <1213690842.23450.9.camel@localhost>
	<873anctpxu.fsf@macbook.be.48ers.dk>  <20080617091112.GF25428@mx.loc>
Message-ID: <1213709075.23450.15.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On mar, 2008-06-17 at 11:11 +0200, Bernhard Fischer wrote:

> On Tue, Jun 17, 2008 at 10:40:13AM +0200, Peter Korsgaard wrote:
> >>>>>> "Luigi" == Luigi 'Comio' Mantellini <luigi.mantellini@idf-hit.com> writes:
> >
> > Luigi> Hi All, I'm new in this mailling list.  I'm trying to
> > Luigi> understand the actual status of the gcc4.3 support into
> > Luigi> buildroot (and soon). I'm working on a (ugly)coldfire 547x cpu
> > Luigi> and gcc4.3 should (re) support my CPU.  Has anyone information
> > Luigi> about the actual support status of gcc4.3 into buildroot?
> >
> >There's so far no gcc 4.3 support in buildroot, but I know Bernhard
> >has gcc 4.3.0 support in his git tree. I might try to port it over
> >next weekend and update it for 4.3.1.
> 
> The 4.3.0 patches should apply 1:1 against 4.3.1
> 


yes, I think, reading the changlog, that differences are just some bug
fix on x86 part.


> I never tried a coldfire toolchain, so don't be surprised if something
> doesn't work out of the box (with my tree). Please let me know if you
> need help and we'll see what i can do.


Sorry for the stupid question: where can I find your git tree? is it
public?

thanks for yours answers.

luigi


Industrie Dial Face S.p.A.
Luigi Mantellini
R&D - Software
Industrie Dial Face S.p.A.
Via Canzo, 4 
20068 Peschiera Borromeo (MI), Italy
Tel.:   +39 02 5167 2813
Fax:    +39 02 5167 2459
E-mail: luigi.mantellini at idf-hit.com
GPG fingerprint: 3DD1 7B71 FBDF 6376
1B4A
                 B003 175F E979 907E
1650
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080617/6f521d9a/attachment.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: idf_logo.gif
Type: image/gif
Size: 4122 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080617/6f521d9a/attachment.gif 
