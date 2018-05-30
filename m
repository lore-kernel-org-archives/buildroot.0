From: Liam Staskawicz <liam@stask.net>
Date: Tue, 29 May 2018 21:32:53 -0700
Subject: [Buildroot] custom skeleton question
In-Reply-To: <874liq5k2q.fsf@dell.be.48ers.dk>
References: <85B790C7-22DB-4715-A360-5D229877EB00@stask.net>
 <874liq5k2q.fsf@dell.be.48ers.dk>
Message-ID: <7C5724A9-4880-4ED6-A49F-D306AD2ADE5B@stask.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On May 29, 2018, at 12:38 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>>>>>> "Liam" == Liam Staskawicz <liam@stask.net> writes:
> 
>> I'd like to create a custom rootfs skeleton based on Ubuntu Base
>> (https://wiki.ubuntu.com/Base) via the existing skeleton-custom
>> package, but rather than ship the entire skeleton in my repo, i'd like
>> to download it (either as a step in another custom package or
>> otherwise).
> 
> Doesn't this "base" already contain a number of libraries and programs?
> I don't quite see how this fits in Buildroot.
> 
>> Given that BR2_ROOTFS_SKELETON_CUSTOM_PATH is evaluated at kconfig
>> time, I don't see the best way to supply this value from another
>> package.
> 
>> Is there a recommended approach to supply this value more dynamically?
> 
> Instead of using it as a rootfs skeleton you could perhaps create a
> package to download such a "base" and extract it on top of the default
> skeleton?

Thanks for the response. I can indeed investigate overlaying it on the default skeleton - mainly wanted to confirm I was not missing an intended way to use the existing skeleton-custom mechanism with a more dynamically supplied custom path. Thank you.

Best,
Liam
