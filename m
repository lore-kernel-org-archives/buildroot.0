From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Mar 2015 23:10:56 +0100
Subject: [Buildroot] [PATCH 1/2] samba: deprecate package due to EOL
In-Reply-To: <20150305230631.4e19032b@free-electrons.com>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>	<54F8D05F.4050300@mind.be>
 <20150305230631.4e19032b@free-electrons.com>
Message-ID: <54F8D470.9060308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/15 23:06, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Thu, 05 Mar 2015 22:53:35 +0100, Arnout Vandecappelle wrote:
>> On 05/03/15 21:44, Gustavo Zacarias wrote:
>>> Samba 3.6.x is now EOL, people should move to samba4.
>>
>>  What about samba support in mpd and kodi?
> 
> And gvfs.

 But that's just a condition on the .mk file so it has no implications for the
missing reverse dependencies.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
