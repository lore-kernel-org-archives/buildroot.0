From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 25 Oct 2017 07:51:35 -0500
Subject: [Buildroot] [PATCH 1/2] stack protector: moved option to
	security menu
In-Reply-To: <6d607f68-8cb7-946d-08e7-910b47d7a12a@mind.be>
References: <1508901900-11190-1-git-send-email-matthew.weber@rockwellcollins.com>
 <6d607f68-8cb7-946d-08e7-910b47d7a12a@mind.be>
Message-ID: <CANQCQpZOUk34rxi15oGArpMi6ghrh_ZQe4aL7e16uwii4oBBBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, Oct 25, 2017 at 2:53 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 25-10-17 05:24, Matt Weber wrote:
>> +menu "Security Hardening Options"
>
>  This is bikeshedding of course, but I don't like submenus too much. They make
> it harder to find the options IMO. For the Advanced options it is good that it's
> a bit hidden, but I think the security options should be pretty in-your-face.
>
>  I do understand though that we want some subdivisions in the menu structure so
> the options that belong together stand out more. Would it be possible to achieve
> the same with comments?
>

I think we could.  I misunderstood your feedback on this back in Aug
and thought pulling those options out of Advanced meant another menu.
I'll wait to see if there is other feedback today and propose a v2
with that update.

Matt
