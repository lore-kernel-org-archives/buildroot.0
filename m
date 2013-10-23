From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Oct 2013 23:36:11 +0200
Subject: [Buildroot] No proc mounted
In-Reply-To: <OFEE44FE8A.B5AEC813-ON85257C0D.0075A5C4-85257C0D.0075CE6F@LocalDomain>
References: <OFE26C9A8F.E4D8CD49-ON85257C0C.006AEB60-85257C0C.006B3127@ametek.com>
 <871u3datxn.fsf@dell.be.48ers.dk>
 <OF01AFC7C1.742725D7-ON85257C0D.004704DA-85257C0D.00471678@LocalDomain>
 <526804A0.3030101@mind.be>
 <OF827CF5C7.0223B4B2-ON85257C0D.005F4956-85257C0D.005F5483@LocalDomain>
 <52680626.8090606@mind.be>
 <OF7B6E1B94.FFB21E9B-ON85257C0D.005FDC58-85257C0D.005FEE0A@LocalDomain>
 <526809BF.5030500@mind.be>
 <OFEE44FE8A.B5AEC813-ON85257C0D.0075A5C4-85257C0D.0075CE6F@LocalDomain>
Message-ID: <5268414B.3040006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/10/13 23:26, Naitik Amin wrote:
> Got it everything is good now.
>   ls
> bin         etc         linuxrc     mnt   root        sys var
> dev         home        lost+found  opt run         tmp
> dummy       lib       media       proc  sbin        usr
>
> The source control system that I use, wud not keep any empty folders !!

  But the weird thing is that it also doesn't store files beginning with 
. (like the .empty files which are there). In root, there's a .profile 
for instance.

>
> Thanks for you insight.
>
> One more question, do u know if I can add openssl, I am looking to do scp
> and ssh into my target from my workstation.

  For that you don't need openssl, but dropbear or openssh under 
Networking applications.

  Regards,
  Arnout

  PS the policy on the mailing list is not to do top-posting. I realize 
that that is hard in Lotus Notes, though.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
