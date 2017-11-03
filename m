From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 15:41:21 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <CA+TH9Vnz0nTfDaAoqPrmbVVxJppBhVo3jz73XYA-ZoOud+9FNg@mail.gmail.com>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <20171102232155.11995715@windsurf>
 <CA+TH9Vkq1oPHSwTTJTzr4MdVRo6=zWMgG5pLKTsf3-ZAwhNKjw@mail.gmail.com>
 <20171103143828.4f57ab67@windsurf>
 <CA+TH9V=Uw2C7L4M0P9+uos5M66EGjLLHFFq50EqJPEGppKhV2Q@mail.gmail.com>
 <20171103145257.172edd86@windsurf>
 <CA+TH9VmEJrzwPHW8c6qR5K1bN5uTTce54vm9Fpq6met2we_bMA@mail.gmail.com>
 <20171103152854.4cfb8076@windsurf>
 <CA+TH9Vnz0nTfDaAoqPrmbVVxJppBhVo3jz73XYA-ZoOud+9FNg@mail.gmail.com>
Message-ID: <20171103154121.3f146ba6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Nov 2017 15:35:14 +0100, Angelo Compagnucci wrote:

> > You could ask for one, see https://cfarm.tetaneutral.net/users/new/.  
> 
> Wonderful! I'll do in minutes!

Good :)

Once your account is enabled, log in to gcc112, and build my two lines
defconfig, and you'll see the problem :)

> > Do you think you could report this issue upstream?  
> 
> I don't think this should be reported as a bug. Mono is running while
> that error happens, so the problem is somewhere in a library or
> similar.
> I'll investigate more when the account on the farm will be enabled.
> 
> I'm just sending a mono bump upstream and hopefully the new version
> will solve the problem. Do you think I'm late?

Yes, you're late, as we're in November, so -rc1 should have already
been released. But since Peter only intends to release -rc1 this
week-end, it's still OK to merge some version bumps. But hurry up,
tomorrow might be too late! :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
