From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 23:59:59 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <87y43ngnic.fsf@dell.be.48ers.dk>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87d1kzjj2w.fsf@dell.be.48ers.dk>
 <20160823234027.49044576@free-electrons.com>
 <87y43ngnic.fsf@dell.be.48ers.dk>
Message-ID: <20160823235959.2a242a36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 23:54:03 +0200, Peter Korsgaard wrote:

> Ahh, ok. And your script really looks for something like
> 
> '<foo>: new package' and not just the first commit for for E.G. every
> .mk file?

Yes, I've looked at "<foo>: new package" commits. Looking at the first
commit if each .mk file would have been a better approach indeed. I can
try to have a look at this alternative approach, and see if it brings
some additional/better details.

>  > Thanks for the feedback!  
> 
> You're welcome, the series looks OK to me.

Thanks. I believe the Python code could definitely get some review, but
follow-up patches are also possible to improve the implementation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
