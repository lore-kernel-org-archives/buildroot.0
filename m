From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 14:58:51 +0200
Subject: [Buildroot] [PATCH v10 0/3] Make the SDK relocatable
In-Reply-To: <8760ejpo9d.fsf@dell.be.48ers.dk>
References: <1500722142-20420-1-git-send-email-wg@grandegger.com>
 <20170722144146.28f826b1@windsurf> <8760ejpo9d.fsf@dell.be.48ers.dk>
Message-ID: <6d6a2f76-7105-4d12-ab38-bd2f8d40a33b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 10:10, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Hello,
>  > On Sat, 22 Jul 2017 13:15:39 +0200, Wolfgang Grandegger wrote:
> 
>  >> Wolfgang Grandegger (3):
>  >> core: introduce "sdk" target to make a relocatable SDK
>  >> support/scripts/fix-rpath: check if the patchelf utility is executable
>  >> support/scripts/fix-rpath: typo fix and unneeded ";" removed
> 
>  > Thanks a lot, I've applied those remaining 3 patches!
> 
>  > I would like to take this opportunity to thank you for your patience
>  > and your dedication in pushing this SDK topic. It's been long overdue
>  > in Buildroot, and the fact that you have taken all comments into
>  > account and sent quickly new iterations was really instrumental to
>  > getting the all thing finally merged. So: many thanks!
> 
> Yes, from me as well - Thanks a lot!

 And me - thanks again!

 Do you happen to go to ELC-E in October, or to FOSDEM in February? It would be
nice to meet at a BR developer meeting.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
