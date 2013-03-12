From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 14:59:25 +0100
Subject: [Buildroot] [PATCH] qt5jsbackend: Remove dependency on bz2
	module
In-Reply-To: <20130312133604.19ae49c5@skate>
References: <1362687540-19440-27-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363084639-9610-1-git-send-email-arnout@mind.be>
 <20130312133604.19ae49c5@skate>
Message-ID: <513F34BD.1050803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/13 13:36, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle (Essensium/Mind),
>
> On Tue, 12 Mar 2013 11:37:19 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>>
>> The Python bz2 module is only needed in certain cases, so only import
>> it when needed. In the normal qt5jsbackend build, this allows to remove
>> the dependency on this module.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Hum, thanks but my Qt5 branch already has a similar patch:
> http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=qt5&id=7c841620816f18bb4547bc905aa3255c7cb967b5

  Yeah, sorry, since you hadn't pushed I was still working against the 
older version of your patch - and I didn't actually look at the mail I 
was replying to :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
