From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Apr 2013 23:41:28 +0200
Subject: [Buildroot] [PATCH 3/3] python-m2crypto: new package
In-Reply-To: <1365532027-13639-3-git-send-email-gustavo@zacarias.com.ar>
References: <1365532027-13639-1-git-send-email-gustavo@zacarias.com.ar>
 <1365532027-13639-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <51648B08.4040102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/13 20:27, Gustavo Zacarias wrote:
> Add the python-m2crypto, host-variant only, for CRDA.

  Is there a reason to make it host-only? Seems like this is potentially 
useful on target as well... Or do you expect build difficulties?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
