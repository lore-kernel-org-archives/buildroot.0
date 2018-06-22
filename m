From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 22 Jun 2018 08:39:55 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] wiringpi: bump version to
 8d188fa0e00bb8c6ff6eddd07bf92857e9bd533a
In-Reply-To: <20180622112049.7fqrarrxt3e4aidd@tarshish>
References: <20180621084908.27568-1-palavrov@gmail.com>
 <20180621211330.2a9d76a9@gmx.net>
 <3AC77B6B-E329-459A-9977-62801F9FD5E6@gmail.com>
 <0A7D321A-C270-401F-8E14-791838DD0637@gmail.com>
 <20180622112049.7fqrarrxt3e4aidd@tarshish>
Message-ID: <1970634448.102374.1529667595795.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Baruch Siach" <baruch@tkos.co.il>
> To: "Atanas Palavrov" <palavrov@gmail.com>
> Cc: "Peter Seiderer" <ps.report@gmx.net>, "buildroot" <buildroot@buildroot.org>
> Sent: Friday, June 22, 2018 8:20:49 AM
> Subject: Re: [Buildroot] [PATCH 1/1] wiringpi: bump version to 8d188fa0e00bb8c6ff6eddd07bf92857e9bd533a

> Hi Atanas,
> 
> On Fri, Jun 22, 2018 at 12:15:59PM +0200, Atanas Palavrov wrote:
>> Well, seems that I did a mess with the new email in patchwork. My idea was
>> to reuse `git send-mail`.
>> I?m attaching the same patch here to discover if patchwork will be smart
>> enough to update the existing patch - didn?t get how to use it from the docs
>> ...
> 
> You can't update the content of an existing patchwork entry.
> 
> The usual procedure is to send another patch that is marked in the subject
> line as v2, v3, etc. You can use the -v command line parameter of 'git
> send-email' (actually 'git format-patch') for that.
> 
> Then, you update the status of the previous patch to 'Superseded'. You need to
> create an account for yourself on patchwork using the same email address as
> the sender of the patch. This would allow you to change the status of your
> patches on patchwork.

You can also link additional email addresses, so you can use both work
and personal email accounts. This is also useful if you move to another
job or your company changes the domain name, like recently happened with
Free Electrons, which was renamed to Bootlin.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
