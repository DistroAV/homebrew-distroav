## What to expect from this ?
DistroAV Brew cask has been deprecated on the official homebrew repository
This new way allows you to leverage the ease-of-use of brew for DistroAV without interruption

## About
This Homebrew tap provides the [DistroAV](https://distroav.org) tap. The cask is updated when a new release is published.

# Casks
For now there is only one cask `distroav`. but if we keep running into challenge on the long run, we could add some of the dependencies here too.

## How do I install DistroAV via brew ?
`brew install --cask distroav/distroav/distroav`
and
`brew reinstall --cask distroav/distroav/distroav`

Yes! This is 3 times the same name, but that's the way.

Or `brew tap distroav/distroav` and then `brew reinstall distroav`.

## Documentation
`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## What if you already installed DistroAV?
Context : You have installed DistroAV from the former `brew install distroav` command

<img width="632" height="429" alt="image" src="https://github.com/user-attachments/assets/ca1b269d-8f0b-462b-bdf3-0d02ef09220a" />

Now you want to install the new cask via `brew install distroav/distroav/distroav` but your get the warning message : 
`Warning: Not upgrading distroav, the latest version is already installed`

<img width="614" height="168" alt="image" src="https://github.com/user-attachments/assets/9d99dec7-5338-417a-9191-2b7e9e331355" />

Try again with `reinstall` instead of `install`

```
`brew reinstall --cask distroav/distroav/distroav`
```

<img width="635" height="467" alt="image" src="https://github.com/user-attachments/assets/1e61c782-02b7-442c-b9b0-9ca28290acb7" />

You shoud also see two distoav Casks with `brew search distroav` the old deprecated and the one managed from DistroAV repo.

<img width="534" height="53" alt="image" src="https://github.com/user-attachments/assets/a8fe536b-cb14-45b8-81ef-7e85fcd23c3c" />


## Contributing

[![Latest Pull Request](https://github.com/distroav/homebrew-distroav/workflows/brew%20pr-pull/badge.svg)](https://github.com/distroav/homebrew-distroav/actions?query=workflow%3Abrew%20pr-pull)


# homebrew-distroav
Install DistroAV easily from Command line on MacOS.

How-to & help
https://docs.brew.sh/Taps
https://casraf.dev/2025/01/distribute-open-source-tools-with-homebrew-taps-a-beginners-guide/

https://docs.brew.sh/Cask-Cookbook

Original (now deprecated) : https://formulae.brew.sh/cask/distroav#default

Code : https://github.com/Homebrew/homebrew-cask/blob/444ce69b6efe57566a073d16e62f5ae50994ac9e/Casks/d/distroav.rb

Widely inspired by the code on OBS repo (thanks!)
