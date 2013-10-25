From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 25 Oct 2013 10:32:09 +0200
Subject: [Buildroot] [PATCH 1/2] packages/Config.in: Alphabetical
	entries sorting
In-Reply-To: <CAAXf6LURr3b-4faaxpRTiR1=jTakx6n16EWGa6Mn88R==UOCAg@mail.gmail.com>
References: <1382620587-22563-1-git-send-email-maxime.hadjinlian@gmail.com>
 <CAAXf6LWFbCs8VTFyn_jzbW-EPcx8Waz10Ue0Cuug0VCQVqFHMA@mail.gmail.com>
 <CAGduivyTD7r7PWt4CpNAAdmhgh_O8Y0hJBatTLcsajGa8gPz5w@mail.gmail.com>
 <CAAXf6LURr3b-4faaxpRTiR1=jTakx6n16EWGa6Mn88R==UOCAg@mail.gmail.com>
Message-ID: <CAGduivyywHPHmCz-F9U_axK5Joz2jrdrd=Ssc14jnhWZFNwyng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 25, 2013 at 8:22 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Maxime,
>
> On Thu, Oct 24, 2013 at 4:11 PM, Maxime Hadjinlian
> <maxime.hadjinlian@gmail.com> wrote:
>> On Thu, Oct 24, 2013 at 3:36 PM, Thomas De Schampheleire
>> <patrickdepinguin@gmail.com> wrote:
>>>
>>> I can follow all changes, except this one: the 'Misc devices
>>> firmwares' menu is a submenu, between normal packages. Moving that in
>>> alphabetical order between normal packages seems very odd to me.
>> I did it after looking at the "Interpreter languages and scripting"
>> menu where the "Lua libraries/modules" would appear in order.
>
> There it makes sense: the 'Lua libraries/modules' submenu comes
> immediately after the 'lua' package (that appears in alpabetical order
> with the other packages in that menu). Moving the Lua libraries menu
> away from the lua package is not logical.
I will cancel that move then.
>
>>
>>> Especially because the name 'Misc' does not carry a real meaning.
>>>
>>> By the way, I don't think that 'firmwares' is correct English, the
>>> '-ware' already is plural, so it should be 'Misc devices firmware' or
>>> maybe plain 'Firmware' (are there other firmware packages in buildroot
>>> that are not part of this menu?).
>> After a very quick search, it seems you are right about the 's' of firmware.
>> About the naming of the menu, we already are in Hardware menu, so
>> talking about "devices" may seem redundant, and the Misc is maybe too
>> cumbersome. Although, a simple "Firmware" would not be very friendly.
>> How about settling on "Firmware's Devices" ? Give or take the casing.
>
> Then this should be 'Device firmware'
> because "Firmware's Devices" means "The devices of firmware" which is
> not what you intend to say.
>
> I'm not convinced there exists firmware for something else than a
> device though. For me 'Firmware' or 'Device firmware' are both ok.
I just though "Firmware" to be a bit blunt, but I am not really good
at wordings as you may have seen so I am OK with whatever is wanted.
>
> Best regards,
> Thomas
