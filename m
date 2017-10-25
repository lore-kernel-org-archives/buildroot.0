From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Oct 2017 09:53:31 +0200
Subject: [Buildroot] [PATCH 1/2] stack protector: moved option to
 security menu
In-Reply-To: <1508901900-11190-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1508901900-11190-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <6d607f68-8cb7-946d-08e7-910b47d7a12a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-10-17 05:24, Matt Weber wrote:
> +menu "Security Hardening Options"

 This is bikeshedding of course, but I don't like submenus too much. They make
it harder to find the options IMO. For the Advanced options it is good that it's
a bit hidden, but I think the security options should be pretty in-your-face.

 I do understand though that we want some subdivisions in the menu structure so
the options that belong together stand out more. Would it be possible to achieve
the same with comments?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
